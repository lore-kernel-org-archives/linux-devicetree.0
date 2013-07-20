From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] Driver configuration using Device Tree
Date: Sat, 20 Jul 2013 07:02:14 +0100
Message-ID: <20130720060214.A7E853E16F1@localhost>
References: <51DC6E52.3080102@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51DC6E52.3080102-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
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
To: Eric Holmberg <eholmber-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: kramasub-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 09 Jul 2013 14:10:58 -0600, Eric Holmberg <eholmber-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> I am trying to determine if Device Tree is an appropriate use for 
> configuring drivers and would like to request comments.  We currently 
> use Device Tree in our Shared Memory Driver (SMD) that manages up to 64 
> ports (where a port consists of an RX FIFO and a TX FIFO) between any 
> two processors and a pair of interrupts for each processor.  The shared 
> memory address and interrupt configuration is stored in Device Tree and 
> since this is hardware, this is considered an acceptable use.  However, 
> we also have two separate modules that use SMD and export devices to 
> userspace through either the TTY framework (SMD TTY) or through a 
> character device (SMD PKT).  For these drivers, the configuration has 
> less to do with hardware and more about which port to connect to in the 
> SMD driver and how to expose the port to userspace through a device 
> node.  This code is used in Linux-based phones.
> 
> The DT configuration looks like this:
>          qcom,smdtty {
>                  compatible = "qcom,smdtty";
> 
>                  qcom,smdtty-ds {
>                          qcom,smdtty-port-name = "DS";
>                          qcom,smdtty-edge = <0>;
>                          qcom,smdtty-dev-idx = <0>;
>                  };
>                  . . .
>                 /* on the order of 10 more port config items */
>        };
> 
> 
> Question
> --------
> Is there a concern that DT should only be used for hardware 
> configuration and that this "driver configuration" is not an acceptable 
> use?  If it is not acceptable, should I go back to using platform 
> devices (seems like a step backwards) or some other method such as 
> exporting a control channel to userspace that can be configured using an 
> IOCTL?

It still is a reasonable leap to say that the DT contains the known-sane
configuration settings that are needed by the platform. It may not be
/strictly/ a hardware description, but it is a description of the usage
model of the platform.

I would however say that you only want that configuration to appear once
in the system. If, say, the linux host sets up and configures the SMD
regions, then I would like to see the remote systems dynamically
receiving the configuration from the linux host instead of having a
separate configuration file.

g.
