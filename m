From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: case sensitivity for devicetree node names
Date: Fri, 10 Jun 2016 15:02:53 -0700
Message-ID: <575B390D.1040600@gmail.com>
References: <575B1D84.2010703@gmail.com>
 <CAL_JsqKw8dVp5y487fo6_mwZfeN6ww8HiYnsudnB8afBrv2oMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKw8dVp5y487fo6_mwZfeN6ww8HiYnsudnB8afBrv2oMQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/10/16 14:38, Rob Herring wrote:
> On Fri, Jun 10, 2016 at 3:05 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> I had assumed that devicetree node names were case sensitive. But a recent
>> email thread asserted that they were not, which made me curious.
> 
> News to me. Got a pointer?
> 
> Rob
> 

http://lkml.iu.edu/hypermail/linux/kernel/1606.1/02457.html

Subject: RE: [RESEND PATCH v2 1/2] device property: Add function to search
for named child of device
From: "Opensource [Adam Thomson]" <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Date: Fri, 10 Jun 2016 09:58:39 +0000


Snippet:

>
> Why do you use strcasecmp() here?

DT node names are case insensitive. The of.h header does provide a helper macro
which is equivalent to this, but that macro is part of the '#ifdef CONFIG_OF'
block. If I were to use it then it would cause non-DT builds to fail. I opted
for strcasecmp() directly as I didn't think for just this one scenario it made
sense to reorganise the of.h header with regards to the helper macros. Of course
if there are other opinions on this then am happy to listen.
