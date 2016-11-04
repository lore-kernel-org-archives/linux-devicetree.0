From: Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: device tree verification tools
Date: Fri, 4 Nov 2016 14:07:08 -0600
Message-ID: <CACxGe6vFmHRtE+=rJnsWrm7BGqqXBXq8FJq_T0r5deGP5pnCYw@mail.gmail.com>
References: <alpine.DEB.2.10.1607262241240.3426@hadrien> <581CE982.60605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <581CE982.60605-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 4, 2016 at 2:03 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 07/26/16 13:43, Julia Lawall wrote:
>> I saw that there will be a microconference on device trees at Linux
>> Plumbers.  Unfortunately, I won't be able to attend, due to another event
>> at the same time, but I was wondering what is the status of verification
>> tools for device tree specifications?
>>
>> thanks,
>> julia
>>
>
> Hi Julia,
>
> Grant Likely is breathing new life into the verification effort.

Hey Julia,

The status is: there are no verification tools for dt.  :-)

I'm /hoping/ to fix that. I've started experimenting with a grammar
for DT schema and writing a schema validation tool, but this isn't my
domain of expertise. I could certainly use your insight. You can see
some of what I've been playing with in this git tree:

https://github.com/glikely/dtgendoc

It is little more than prototype code, and nothing has been formalized
yet. I'm open to taking other approaches.

Cheers,
g.


>
> -Frank
