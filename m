From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] drm/msm: remove qcom,gpu-pwrlevels bindings
Date: Mon, 30 Jan 2017 13:35:47 -0500
Message-ID: <CAF6AEGt8mj8S+iv8aHVwyqm3f-5NhzmRv5Ajv5TmJXee5YLxVg@mail.gmail.com>
References: <20170130164921.20744-1-robdclark@gmail.com> <20170130164921.20744-2-robdclark@gmail.com>
 <87vaswh0i9.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vaswh0i9.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2017 at 1:21 PM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
> Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> The plan is to use the OPP bindings.  For now, remove the documentation
>> for qcom,gpu-pwrlevels, and make the driver fall back to a safe low
>> clock if the node is not present.
>>
>> Note that no upstream dtb use this node.  For now we keep compatibility
>> with this node to avoid breaking compatibility with downstream android
>> dt files.
>>
>> Signed-off-by: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Will we need the bus frequency knobs that I see in the old pwrlevels
> node?  If so, what would the plan be for doing that within OPP?

So, that I think is one of the open questions.  Jordan knows this
stuff a lot better than I, but my understanding is that bus and clk
scale *basically* independently, except that a given gpu clk we want a
different minimum bus clk.

(I'm not sure if that is a functional requirement, or just what qcom
arrived at after performance tuning..)

There is some work ongoing to get some sort of upstream bus scaling
scaling, although I'm not really sure yet what the bindings for this
would look like.

So basically short answer is "I don't know.. there are too many open
questions".  Maybe in the end we re-introduce qcom,gpu-pwrlevels.  But
I think for now the approach of not documenting it and have safe/slow
clk fallback in the driver is a reasonable way to move forward with
getting some basic gpu nodes into upstream dts files.

BR,
-R
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
