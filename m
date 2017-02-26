From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/9] ASoC: sun8i-codec-analog: split out
	linein and mic2
Date: Sun, 26 Feb 2017 14:06:06 +0800
Message-ID: <CAGb2v66Yhw1kxAzWE0RjUYe+reUswdw=3jx4MRErbjbGaMjtGQ@mail.gmail.com>
References: <20170225123029.55939-1-icenowy@aosc.xyz>
 <20170225123029.55939-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20170225123029.55939-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 25, 2017 at 8:30 PM, Icenowy Zheng <icenowy@aosc.xyz> wrote:
> Allwinner V3s SoC features an analog codec without linein and mic2.
>
> Split out them, in order to prepare for the analog codec on V3s.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Acked-by: Chen-Yu Tsai <wens@csie.org>

Though it would be better if you did 1 split as 1 patch, with 2 patches
in total.
