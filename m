From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Reminder 1: Device Tree documentation discussion for Cell/B.E.
	binding DRAFT - see Digest Vol 6, Issue 1
Date: Tue, 30 Dec 2008 14:09:47 -1000
Message-ID: <495AB84B.1070602@firmworks.com>
References: <OF89278B7C.B7D060FF-ONC1257521.004C9E27-C1257521.004D3F55@de.ibm.com>	<fa686aa40812161408j3672ba5cs7d8526cd643b69de@mail.gmail.com>
	<495AA9FB.40902@genesi-usa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <495AA9FB.40902-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: Christian Rund <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> The OF spec for device_type states is MEANT to supply information 
> about how to access the device programmatically, whether this be 
> through a client interface API such as "serial" or "network", I think 
> while this distinction may be "clever" from the point of view of 
> redefining it for Linux DTBs and reducing some redundancy,


IEEE Std 1275-1994 page 132:

"device_type"
      Standard property name to specify the implemented interface       
(Note: this is the brief description, which is a hint, not the normative 
part)
      ...
      (Normative text:)
      Specifies the "device type" of this package, thus implying a 
specific set of package class methods implemented by the package.

Note that it does not specify the programming model of the hardware - it 
specifies the *package* interface.

In the context of a device tree that is disconnected from a functional 
Open Firmware implementation, device_type is meaningless and arguably 
inaccurate, asserting the existence of a set of methods that is not in 
fact present.

For binding an OS driver to hardware, you need to know the hardware 
programming model, as specified by "compatible".  "device_type" doesn't 
specify the hardware programming model, so misusing it for driver 
binding is a bad idea.  Please don't propagate such mistakes.

The original use of device_name was for an Open Firmware implementation 
to find nodes that might be candidates for specific internal uses, most 
notably console devices.  The most compelling use case is when a plug-in 
video card would automatically become the preferred console output 
device.  But in a lot of real-world situations, automated device choice 
of this ilk is a problem.   You often need to wire down a device list to 
avoid user confusion and make it possible to write definitive 
documentation.  (There were also some diagnostic-related uses such as 
probe-scsi-all.)

If I could redo history, device_type would not have been included in the 
standard.  It was an OBP1-ism and, unfortunately, I didn't realize my 
mistake until it was too late.

> I prefer to think of this in the same way as a PCI class code or 
> similar - a device_type of "fsl,mpc5200b-i2c" therefore specifies that 
> it is a Freescale i2c bus on the MPC5200B, and a compatible property 
> would dictate that it is compatible with generic "fsl,i2c" bus 
> specification and register set. 

There is a legitimate need for something like a "class code" to indicate 
in a vague way what general kind of device it is.  That is accomplished 
by the "name" property as reinterpreted by the "generic names" 
recommended practice.
