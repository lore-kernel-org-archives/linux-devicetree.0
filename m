From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: case sensitivity for devicetree node names
Date: Mon, 13 Jun 2016 22:29:35 -0700
Message-ID: <575F963F.8090105@gmail.com>
References: <575B1D84.2010703@gmail.com>
 <20160614011021.GD4882@voom.fritz.box> <575F7FC1.5040508@gmail.com>
 <20160614051028.GL4882@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160614051028.GL4882-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/13/16 22:10, David Gibson wrote:
> On Mon, Jun 13, 2016 at 08:53:37PM -0700, Frank Rowand wrote:
>> On 06/13/16 18:10, David Gibson wrote:

< snip >

>>> Here's my inclination for how to treat this in dtc for the time being:
>>>     1) Leave the bulk of dtc case sensitive, as now
>>>     2) Add a new check which will generate an error if there are node
>>>        names which differ only in case.
>>>
>>> Any objections to that plan?
>>
>> I think that the kernel should match the current behavior of dtc.
>>
>> I agree with "1)".
>>
>> I don't think that "2)" is required.  I think it is a really dumb idea for
>> anyone to create a dts with node names that differ only in case.  But I
>> don't think it is the compiler's job to protect people from being dumb.
>> An analogue would be the C language and compilers.  The C compiler doesn't
>> error on a program that has variables "foo" and "Foo".
> 
> Hmm.. actually I think protecting you from being dumb is exactly the
> purpose of compiler warnings.  Now that you found that quote from
> 1275, which is pretty definitive as far as I'm concerned, I'd expect
> to reduce that error to a warning (by default).

A warning is ok by me.

-Frank
