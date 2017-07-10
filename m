From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] dt-bindings: display: sunxi: Improve endpoint ID scheme readability
Date: Mon, 10 Jul 2017 23:48:00 +0800
Message-ID: <CAGb2v67wZ_dg0T1+_NuzatuuuRZ2eAQo94KWtSsEJk_0HmU6qQ@mail.gmail.com>
References: <20170614063016.22069-1-wens@csie.org> <20170618140536.dr6ck3chaglfgz6t@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170618140536.dr6ck3chaglfgz6t@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 18, 2017 at 10:05 PM, Rob Herring <robh@kernel.org> wrote:
> On Wed, Jun 14, 2017 at 02:30:16PM +0800, Chen-Yu Tsai wrote:
>> The explanation for the endpoint ID numbering scheme is convoluted
>> and hard to understand.
>>
>> This patch aims to improve the readability of it by combining the
>> existing two paragraphs, while also providing a diagram example,
>> and how endpoints should be numbered based on that example.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> ---
>>
>> Hope this helps. I'm not sure I can improve this even more without
>> spelling out all cases.
>>
>> ---
>>  .../bindings/display/sunxi/sun4i-drm.txt           | 36 ++++++++++++++++------
>>  1 file changed, 27 insertions(+), 9 deletions(-)
>
> Acked-by: Rob Herring <robh@kernel.org>

Maxime, this patch seems to have fallen through the cracks.

Could you queue it as a fix for 4.13?

Thanks
ChenYu
