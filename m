From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: Reminder 1: Device Tree documentation discussion for Cell/B.E.
	binding DRAFT - see Digest Vol 6, Issue 1
Date: Tue, 30 Dec 2008 17:08:43 -0600
Message-ID: <495AA9FB.40902@genesi-usa.com>
References: <OF89278B7C.B7D060FF-ONC1257521.004C9E27-C1257521.004D3F55@de.ibm.com>
	<fa686aa40812161408j3672ba5cs7d8526cd643b69de@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40812161408j3672ba5cs7d8526cd643b69de-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Christian Rund <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Tue, Dec 16, 2008 at 7:03 AM, Christian Rund
> <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> 1 "be" node
> [...]
>> "device-type" property
>>
>>             Standard property name which specifies the type of the node.
>>
>>             Encoded as with encode-string.
>>
>>             Default value is { "be" }.
> 
> Is a new OpenFirmware driver interface being defined for working with
> 'be' devices?  If not then the device-type property should not be
> defined.

I think that while the distinction that it requires a driver interface 
is moot (and probably overdiscussed and therefore after this, I will 
drop it)..

** more prudent in this case is that even if it is specified or not, the 
property is named "device_type" with an underscore, not a hyphen **

 > First comments; This document is quite verbose.  Much time is spent
 > describing how standard properties work (ie; content of the 'reg' and
 > 'ranges' properties).  Reviewing takes more effort when there is a
 > large amount of boilerplate to filter.

I would let this go through if only because getting access to the 
original OpenFirmware specification is getting more and more "difficult" 
these days (while it's available in many places, some of them are a 
little obscure and most people won't find it in a portable, easily 
readable format from a Google search. No, I don't consider PostScript an 
easily readable format..)

Having the Cell/BE DT specification self-contained makes it harder to 
review but far more useful as a document unto itself. Cross-referencing 
is time consuming and there is already far, far too much to read up on 
the subject for very little benefit.

Perhaps, though, the "boilerplate" could be whittled down slightly such 
that it does not overshadow the real new specification in the document.

 > Second, very few nodes have a 'compatible' value defined.  Currently,
 > the 'compatible' list is the preferred method for device drivers to
 > find supported devices in the tree.  Each distinct device should have
 > a unique compatible value defined.

Since Linux and every other OpenFirmware-supporting device implements 
device_type (see below) and this is checked BEFORE compatible properties 
when searching for compatible entries, this distinction is moot.

As long as device_type exists in the node, compatible is not necessarily 
required. This conforms to the OpenFirmware specification, and produces 
completely acceptable behaviour within Linux and any other OS.

The OF spec for device_type states is MEANT to supply information about 
how to access the device programmatically, whether this be through a 
client interface API such as "serial" or "network", I think while this 
distinction may be "clever" from the point of view of redefining it for 
Linux DTBs and reducing some redundancy, I prefer to think of this in 
the same way as a PCI class code or similar - a device_type of 
"fsl,mpc5200b-i2c" therefore specifies that it is a Freescale i2c bus on 
the MPC5200B, and a compatible property would dictate that it is 
compatible with generic "fsl,i2c" bus specification and register set.

If there is no standard client interface methods defined for it then at 
least it gives a fairly good hint as to the device in order to program 
it by any other means.

It also looks better when you're a human reading device trees. Chip 
company's XX1234 controller is not "only" compatible, it *IS* a Chip 
XX1234. Having device_type list the specific chip and compatible listing 
register-compatible or API-compatible devices (for instance 
chip,xx1233). There is no other place to reference this distinction of 
which chip it actually is, and not which chips it is simply very similar 
or identical to, apart from the OPTIONAL "model" property.

Please let's not nitpick that "device_type" is obselete, because it 
isn't, you could not remove the check for device_type from the device 
tree code, nor any device tree on a real OF machine.

It is still a useful and informative property which COULD be given 
something of a new meaning (which implies or does not imply certain 
attributes for hardware components). Anyone can put in device_type into 
a DTS and it will not destroy the spacetime continuum or cause world 
famine or wars to get worse. The mere fact that it goes from being 
required to "completely optional and practically obselete" from OF 
specification (which does not dictate that device_type MUST conform to a 
CIF package or set of methods, only that it should if it could) to the 
DTS specification is just makes the Linux spec contrary for the sake of 
being contrary.

--
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
