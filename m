From: Eric Holmberg <eholmber-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [RFC] Driver configuration using Device Tree
Date: Tue, 09 Jul 2013 14:10:58 -0600
Message-ID: <51DC6E52.3080102@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: kramasub-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I am trying to determine if Device Tree is an appropriate use for =

configuring drivers and would like to request comments.  We currently =

use Device Tree in our Shared Memory Driver (SMD) that manages up to 64 =

ports (where a port consists of an RX FIFO and a TX FIFO) between any =

two processors and a pair of interrupts for each processor.  The shared =

memory address and interrupt configuration is stored in Device Tree and =

since this is hardware, this is considered an acceptable use.  However, =

we also have two separate modules that use SMD and export devices to =

userspace through either the TTY framework (SMD TTY) or through a =

character device (SMD PKT).  For these drivers, the configuration has =

less to do with hardware and more about which port to connect to in the =

SMD driver and how to expose the port to userspace through a device =

node.  This code is used in Linux-based phones.

The DT configuration looks like this:
         qcom,smdtty {
                 compatible =3D "qcom,smdtty";

                 qcom,smdtty-ds {
                         qcom,smdtty-port-name =3D "DS";
                         qcom,smdtty-edge =3D <0>;
                         qcom,smdtty-dev-idx =3D <0>;
                 };
                 . . .
                /* on the order of 10 more port config items */
       };


Question
--------
Is there a concern that DT should only be used for hardware =

configuration and that this "driver configuration" is not an acceptable =

use?  If it is not acceptable, should I go back to using platform =

devices (seems like a step backwards) or some other method such as =

exporting a control channel to userspace that can be configured using an =

IOCTL?


More Detailed Background Information
------------------------------------
Here=92s a diagram showing the modules to help visualize the system.

                   +-------------------------------+
                   |                               |
                   |    SMD Userspace Clients      |
                   |                               |
                   +-------------------------------+
    User space              ^              ^
  +-------------------------|--------------|----------------------+
    Kernel space            +              +
                      +--------------------------+
                      | Linux Virtual File Sys   |
                      |                          |
                      +--------------------------+
                            ^              ^
                            |              |
                            |        +---------------+
                            |        |    Linux      |
                            |        | TTY Framework |
                            |        +---------------+
                            |              ^
                            |              |
     +---------+            |              |               +---------+
     |   DT    |      +-----------+  +-----------+         |   DT    |
     |  Config |+---->|    SMD    |  |    SMD    |<-------+|  Config |
     |         |      |    PKT    |  |    TTY    |         |         |
     +---------+      +-----------+  +-----------+         +---------+
                            |              |
                            |              |
                            v              |
                            O <------------+
                            |
     +---------+            |
     |   DT    |      +------------------------+
     |  Config |+---->|          SMD           |
     |         |      |                        |
     +---------+      +------------------------+
                         |             ^   |
                         |             |   |
                         |             |   |
                         |             |   |
                         |             |   |
                         |             |   |
                         v             |   |
               +--------------------+  |   |Interrupts
               |                    |  |   |
               |  Shared Memory     |  |   |
               |                    |  |   |
               +---------+----------+  |   |
                         |             |   |
                         |             |   |
                         |             |   |
                         |             |   |
                         |             |   |
                         |             |   |
                         v             |   v
          +-----------------------------------+
          |                                   |
          |     Remote System (Modem, etc)    |
          |                                   |
          +-----------------------------------+

Here=92s an example of our DT schema.  Each SMD channel is uniquely =

identified in the system by the NAME:EDGE, so this is included in the =

configuration along with the index or name of the device node to export =

to userspace (either a TTY device for streaming-mode data or a character =

device for packet-mode data).

[Root level node]
Required properties:
	-compatible: should be "qcom,smdtty"

[Second level nodes]
qcom,smdtty-port-names
Required properties:
	-qcom,smdtty-port-name: the name that identifies the smd channel
	-qcom,smdtty-edge: the smd edge (this is an enumeration that
			identifies the local<->remote processor edge)
	-qcom,smdtty-dev-idx: the device node index

Example:

         qcom,smdtty {
                 compatible =3D "qcom,smdtty";

                 qcom,smdtty-ds {
                         qcom,smdtty-port-name =3D "DS";
                         qcom,smdtty-edge =3D <0>;
                         qcom,smdtty-dev-name =3D <0>;
                 };

                 qcom,smdtty-apps-fm {
                         qcom,smdtty-port-name =3D "APPS_FM";
                         qcom,smdtty-edge =3D <6>;
                         qcom,smdtty-dev-name =3D <1>;
                 };

                 qcom,smdtty-gpsnmea {
                         qcom,smdtty-port-name =3D "GPSNMEA";
                         qcom,smdtty-edge =3D <0>;
                         qcom,smdtty-dev-name =3D <27>;
                 };
         };

Thanks,

Eric Holmberg
-- =

The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation.
