From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/10] ASoC: dt-bindings: add dt
 bindings for wcd9335 audio codec
Date: Wed, 1 Aug 2018 16:20:20 -0600
Message-ID: <CAL_JsqKcxB2NZR94BP9-Qc8AAFsySPoADm2UA_ZV8V7JdP8-wQ@mail.gmail.com>
References: <20180727121806.18209-1-srinivas.kandagatla@linaro.org>
 <20180727121806.18209-2-srinivas.kandagatla@linaro.org>
 <20180731204315.GA5265@rob-hp-laptop>
 <53a4e82c-7270-fdbd-a2ea-efbfc2d747a2@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <53a4e82c-7270-fdbd-a2ea-efbfc2d747a2@linaro.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Vinod <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 1, 2018 at 2:57 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Thanks for the review.
>
> On 31/07/18 21:43, Rob Herring wrote:
> >> +
> >> +- reset-gpio:
> > reset-gpios
> >
> Yep, reset-gpios makes more inline with others!
> >> +    Usage: required
> >> +    Value type: <String Array>
> >> +    Definition: Reset gpio line
> >> +
> >> +- qcom,ifd:
> >> +    Usage: required
> >> +    Value type: <phandle>
> >> +    Definition: SLIM interface device
> > Wouldn't this be the parent?
> >
> No, Interface device is just like other slim device and is part of
> SLIMbus Component and has a unique address. Every SLIMbus component has
> one interface device.

I still don't understand what this means. If this is SLIMbus specific,
then maybe it should be named that way? Or it is QCom specific?

Rob
