From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] arm64: dts: mt8183: Add node for the Mali GPU
Date: Mon, 23 Sep 2019 15:33:25 +0100
Message-ID: <3dfa9e3c-9a78-90d1-68c9-7b64a3d734e4@arm.com>
References: <20190905081546.42716-1-drinkcat@chromium.org>
 <CAL_JsqJCO2G90TTT9Mpy4kjVKQyXWw4aXEEnbRp_SE8X=EGc5g@mail.gmail.com>
 <CANMq1KCTPdFhJG1SLf-i+-557Yx-1WLzWCHu3tT_5Q2BF+JgdQ@mail.gmail.com>
 <20190913181729.GB3115@kevin>
 <CANMq1KD++==d0Mb6T2gKU1T7c_MaedswOYdxqEqEKKUL1bxgiw@mail.gmail.com>
 <20190919123243.GA3457@kevin>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190919123243.GA3457@kevin>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Nicolas Boichat <drinkcat@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Dominik Behr <dbehr@chromium.org>, Douglas Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Boris Brezillon <boris.brezillon@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Nick Fan <nick.fan@mediatek.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 19/09/2019 13:32, Alyssa Rosenzweig wrote:
>>> By the time MT8183 shows up in more concrete devices, it will, certainly
>>> in kernel-space and likely in userspace as well. At present, the DDK can
>>> be modified to run on top of the in-tree Mali drivers, i.e. "Bifrost on
>>> mainline linux-next (+ page table/compatible patches), with blob
>>> userspace".

Actually most(?) Bifrost GPUs support the "legacy" 'LPAE-ish' page table
format. So the only kernel change *required* is adding the compatible
string (and any SoC-specific quirks).

The support for "blob-on-Panfrost" is currently an experimental internal
investigation. So I can't make any promises about it ever being released
publicly.

>>> While the open userspace isn't ready here quite yet, I would definitely
>>> encourage upstream kernel for ChromeOS, since then there's no need to
>>> maintain the out-of-tree GPU driver.
>>
>> That's an interesting idea, I had no idea, thanks for the info!
>>
>> Would that work with midgard as well? We have released hardware with
>> RK3288/3399, so it might be nice to experiment with these first.
> 
> Yes, the above would work with Midgard as well with no changes needed.
> Ping Steven about thtat (CC'd).

Indeed since it's the same kernel driver the same compatibility layer
can be used to run Midgard DDK blob on Panfrost. Although given the
progress that has already occurred with the Mesa Panfrost user space you
might be able to simply switch to a completely open stack (available now).

Again I'm afraid I'm not in a position to give any guarantees that my
prototype blob-on-Panfrost work will actually be released or timescales
of when. However since the current focus internally is on newer GPUs I'm
less confident that there will be interest for Midgard DDK on Panfrost.

Steve

>>> More immediately, per Rob's review, it's important that the bindings
>>> accepted upstream work with the in-tree Bifrost driver. Conceptually,
>>> once Mesa supports Bifrost, if I install Debian on a MT8183 board,
>>> everything should just work. I shouldn't need MT-specific changes / need
>>> to change names for the DT. Regardless of which kernel driver you end up
>>> using, minimally sharing the DT is good for everyone :-)
>>
>> Yes. I'll try to dig further with MTK, but this may take some time.
> 
> Thank you!
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
