From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: devicetree-discuss Digest, Vol 6, Issue 7
Date: Fri, 19 Dec 2008 16:24:14 -0700
Message-ID: <fa686aa40812191524k6ae8fab0r962da830ab159ca0@mail.gmail.com>
References: <mailman.11.1229475607.16627.devicetree-discuss@ozlabs.org>
	<OF6B36395E.E0A4363C-ONC1257522.0035FA7C-C1257523.004E84FF@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <OF6B36395E.E0A4363C-ONC1257522.0035FA7C-C1257523.004E84FF-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Christian Rund <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 18, 2008 at 7:17 AM, Christian Rund
<Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
> From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Is a new OpenFirmware driver interface being defined for working with
>> 'be' devices?
>
> No
>
>> If not then the device-type property should not be
>> defined.
>
> The device-type property instances will be removed where not
> necessary or no OpenFirmware binding recommendations exist
> respectively.

Okay, good.

>> > Default value is { 0x00510000 0x00001000 0x00511000 0x00001000 }.
>>
>> These spaces are contiguous; what is the reason for the two array entries?
>
> The spaces are in fact contiguous, but belong to two different units.
> 0x00510xxx covers the IOC Address Translation MMIO Registers, whereras
> 0x00511xxx covers the I/O Command MMIO Registers.
> Despite, Linux is mapping the two ranges in one single step, which means
> the range can well be summarized to
>         Default value is { 0x00510000 0x00002000 }.

Belonging to different units is not a problem if it makes logical
sense.  How Linux is currently using the data is irrelevant.  Do
whatever describes the hardware best, *but* if two ranges are used,
then the documentation must say what each of the ranges are.

>> > The pervasive node node represents the  pervasive unit in the device
>> > tree.
>> > T>he main property value is the address range of MMIO register space
>> > controlling the pervasive unit.
>>
>> Umm, what is a "pervasive unit"?
>
> The pervasive node represents the 'Pervasive MMIO Registers' (i.e.
> Pervasive Monitor, Power Management and Thermal Management described
> in the Cell/B.E. public register spec.

Sounds like this blurb should be added to the document.  :-)

>> > property name: Property to specify the physical id of an SPE.
>> >
>> > Default values for the physical id is encoded as with encode-int.
>>
>> Unless there is some shared register set that needs the SPE physical
>> id to operate then I encourage you not to define this property.  If it
>> is just a logical number, the I think it is better to rely on the node
>> name instead of an arbitrarily defined logical number.  However, if
>> there is a register set shared between the SPEs that needs the SPE
>> number, then you should follow the lead of other existing bindings and
>> use the property name "cell-index" instead of physical-id.
>
> The "physical-id" property is used by Linux (see information on ppc-patch
> below).

"Because Linux Uses It" isn't actually a good answer.  The device tree
must describe the hardware platform; not the way the OS uses it.  What
is the physical ID used for?  Does it have a bearing on how Linux
drives the hardware or is it just a convenient number to uniquely id
the SPE?  If it doesn't have a bearing on how to use the hardware then
I think the 'physical-id' property is just a hack and should be
removed.  If Linux wants a unique id, then Linux should assign and
manage the ID numbers itself (IMNSHO).

If it *does* have a bearing on how to drive the hardware, then yes it
makes sense to use such a property.

Cheers,
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
