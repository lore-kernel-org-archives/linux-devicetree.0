From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/3] ARM: dts: sun8i: Add dt nodes for sdio wifi
Date: Fri, 26 Aug 2016 17:52:05 +0200
Message-ID: <43e78c53-77ee-5e20-a060-9e60ce37d3f0@redhat.com>
References: <20160826145236.30210-1-hdegoede@redhat.com>
 <1318301472223656@web13m.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1318301472223656@web13m.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 26-08-16 17:00, Icenowy Zheng wrote:
>
>
> 26.08.2016, 22:58, "Hans de Goede" <hdegoede@redhat.com>:
>> Hi Maxime,
>>
>> Now that Ulf has merged the post-power-on-delay-ms mmc-pwrseq patches
>> in his mmc/next tree and Rob Herring has accepted the esp8089 dt
>> bindings (and specifically the esp,crystal-26M-en property), these
>> are ready for merging.
>
> Can the driver now work without broken-cd?

Sort-off, my fork of the esp8089 driver has a workaround so that
it does not need broken-cd. I'm also working together with
Ulf (the mmc maintainer) to come up with a clean upstream
solution for this.

Regards,

Hans
