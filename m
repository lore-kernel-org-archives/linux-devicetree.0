From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: cache phandle nodes to decrease cost of
 of_find_node_by_phandle()
Date: Thu, 1 Feb 2018 11:10:35 -0800
Message-ID: <fd9f5f63-b08e-602e-1510-85a65889f550@gmail.com>
References: <1517429142-25727-1-git-send-email-frowand.list@gmail.com>
 <5b84a166-c71b-3a41-9e7f-a7624a8441f6@codeaurora.org>
 <38cdcae5-ec0f-d1be-b024-1990d4387731@gmail.com>
 <9e23d32f-05a0-ce8a-41f8-9a1a3d66be37@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9e23d32f-05a0-ce8a-41f8-9a1a3d66be37-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/01/18 02:31, Chintan Pandya wrote:
> 
>>> Anyways, will fix this locally and share test results.
>>
>> Thanks, I look forward to the results.
>>
> 
> Set up for this time was slightly different. So, taken all the numbers again.
> 
> Boot to shell time (in ms): Experiment 2
> [1] Base            : 14.843805 14.784842 14.842338
> [2] 64 sized fixed cache    : 14.189292 14.200003 14.266711
> [3] Dynamic freeable cache    : 14.112412 14.064772 14.036052
> 
> So, [3] (this patch) looks to be improving 750ms (on avg from base build).
> 

Is this with the many debug options enabled?  If so, can you repeat with
a normal configuration?

Thanks,

Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
