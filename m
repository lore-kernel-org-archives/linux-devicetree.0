From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: Reminder 1: Device Tree documentation discussion for Cell/B.E.
	binding DRAFT - see Digest Vol 6, Issue 1
Date: Tue, 30 Dec 2008 17:20:29 -0600
Message-ID: <495AACBD.4080804@genesi-usa.com>
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

>> "model" property
>>             property name: Specifies model of node.
>>             Encoded as with encode-string.
>>             Default value is { "IBM,CBEA" }.
> 
>> "ibm,dt-version" property
> 
> I'm concerned about the usage model of this property.  It is not
> common for driver to go looking for an additional version property
> when interpreting node data.

Then that sucks, because they SHOULD be checking the model property if 
it is known that a device may have errata, quirks or other problems 
which cannot be programmatically detected in other ways (for instance 
via version registers in the chip itself).

>  Are all drivers expected to test the value of this property?

I would expect that once the model or version property is filled by the 
device tree compiler or by the OF implementation, people will get used 
to it being there. When it comes time that it may need to be checked 
for, then it already exists; nobody will have to update their firmwares, 
or device trees, or program any flash chips, just update their kernel or 
recompile a module and unload/load it to get the changes and/or fixes.

You never complained that we fill out the version of the firmware (and 
the build-date integer) in the Pegasos or Efika device trees. And rather 
than make any particular checks on them, code has been submitted which 
makes blanket changes not dependant on version, but on the presence of 
certain nodes (and also NOT on the lack of properties inside those 
nodes, too, when creating new property data). I've always thought such 
trashing of firmware data without proper checks is both intrusive and 
also creates yet another moving target for software developers to take 
heed of. It makes working with Linux far, far more frustrating from 
board bring-up all the way up to end users installing a prebaked 
distribution..

>  What should they do when the major or minor values do not match?

I would expect that this is to be determined when the version number 
becomes an actual, actionable item.

One might stop booting if the firmware version is too old, or initiate 
some fixups (such as using a compiled-in ACPI table as is done on many 
older PC motherboards). Certain VIA EPIA boards have lots of weird 
behaviours and the BIOS vendor string plus a few other heuristics are 
employed to make sure they are worked around.

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
