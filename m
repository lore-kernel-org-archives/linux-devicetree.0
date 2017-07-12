From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: display: sunxi: Improve endpoint ID scheme readability
Date: Wed, 12 Jul 2017 10:38:38 +0800
Message-ID: <CAGb2v64aoXsoE=YL_PFLkdU7rBZdpqhg37CKuQU-1F+SV9=zcw@mail.gmail.com>
References: <20170614063016.22069-1-wens@csie.org> <20170618140536.dr6ck3chaglfgz6t@rob-hp-laptop>
 <CAGb2v67wZ_dg0T1+_NuzatuuuRZ2eAQo94KWtSsEJk_0HmU6qQ@mail.gmail.com> <20170711193111.p6jdyesluuqdlu3j@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170711193111.p6jdyesluuqdlu3j@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 12, 2017 at 3:31 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Mon, Jul 10, 2017 at 11:48:00PM +0800, Chen-Yu Tsai wrote:
>> On Sun, Jun 18, 2017 at 10:05 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> > On Wed, Jun 14, 2017 at 02:30:16PM +0800, Chen-Yu Tsai wrote:
>> >> The explanation for the endpoint ID numbering scheme is convoluted
>> >> and hard to understand.
>> >>
>> >> This patch aims to improve the readability of it by combining the
>> >> existing two paragraphs, while also providing a diagram example,
>> >> and how endpoints should be numbered based on that example.
>> >>
>> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> >> ---
>> >>
>> >> Hope this helps. I'm not sure I can improve this even more without
>> >> spelling out all cases.
>> >>
>> >> ---
>> >>  .../bindings/display/sunxi/sun4i-drm.txt           | 36 ++++++++++++++++------
>> >>  1 file changed, 27 insertions(+), 9 deletions(-)
>> >
>> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Maxime, this patch seems to have fallen through the cracks.
>>
>> Could you queue it as a fix for 4.13?
>
> Sorry, I don't know why I overlooked it.
>
> Is it really 4.13 material though? It doesn't look that urgent.

Unless I'm mistaken, this clarifies the numbering scheme introduced
in 4.13. I'd say that's enough reason to have it in the same release.

But I should update the diagram first. The backend <-> TCON mux is
missing. And maybe a Fixes tag.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
