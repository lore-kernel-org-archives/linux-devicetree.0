From: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC][PATCH 1/2] WIP: Devicetree bindings for Ion
Date: Mon, 12 Oct 2015 11:39:43 -0700
Message-ID: <vnkwh9lwlymo.fsf@codeaurora.org>
References: <1444164433-9107-1-git-send-email-labbott@fedoraproject.org>
	<1444164433-9107-2-git-send-email-labbott@fedoraproject.org>
	<CAL_JsqJ+i3zC7UJ3BcdtOhdmQd8YnRC7bs3D2Ei5JD-4-C+A0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ+i3zC7UJ3BcdtOhdmQd8YnRC7bs3D2Ei5JD-4-C+A0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Rob Herring's message of "Tue, 6 Oct 2015 17:35:41 -0500")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laura Abbott <labbott-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Andrianov <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>, arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tom Gall <tom.gall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, romlem-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Feng Tang <feng.tang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 06 2015 at 05:35:41 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Oct 6, 2015 at 3:47 PM, Laura Abbott <labbott-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> wrote:

[...]

>> +Example:
>> +
>> +       ion {
>> +               compatbile = "linux,ion";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               ion-system-heap {
>> +                       linux,ion-heap-id = <0>;
>> +                       linux,ion-heap-type = <ION_SYSTEM_HEAP_TYPE>;
>> +                       linux,ion-heap-name = "system";
>
> How does this vary across platforms? Is all of this being pushed down
> to DT, because there is no coordination of this at the kernel ABI
> level across platforms. In other words, why can't heap 0 be hardcoded
> as system heap in the driver. It seems to me any 1 of these 3
> properties could be used to derive the other 2.

The heap-id<->heap-type mapping isn't necessarily 1:1.  As Laura
indicated elsewhere on this thread, a given heap might need to be
contiguous on one platform but not on another.  In that case you just
swap out the heap-type here and there's no need for userspace to change.

The heap-name, OTOH, could be derived from the heap-id, which is what we
hackishly do here [1] and here[2].

[1] https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.14/tree/drivers/staging/android/ion/msm/msm_ion.c?h=msm-3.14#n53
[2] https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.14/tree/drivers/staging/android/ion/msm/msm_ion.c?h=msm-3.14#n398


-Mitch

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
