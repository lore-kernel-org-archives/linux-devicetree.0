From: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Subject: Re: [PATCH 3/4] ARM64: dts: meson-gx: add dmcbus and canvas nodes.
Date: Sat, 4 Aug 2018 22:02:46 +0200
Message-ID: <CAHStOZ5VaOiOQhi7vG0Q9R7gF+LHvZim1qsEUJanZkFoXqgwDA@mail.gmail.com>
References: <20180801185128.23440-1-maxi.jourdan@wanadoo.fr>
 <20180801185128.23440-4-maxi.jourdan@wanadoo.fr>
 <CALecT5hgk+Wuh4-UWY29NNoEz-47Fx3pSjve8raCd3hRMzXE5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CALecT5hgk+Wuh4-UWY29NNoEz-47Fx3pSjve8raCd3hRMzXE5w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yixun Lan <yixun.lan@gmail.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Maxime Jourdan <maxi.jourdan@wanadoo.fr>, linux-amlogic <linux-amlogic@lists.infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

>> +                       sysctrl_DMC: system-controller@0 {
>> +                               compatible = "amlogic,meson-gx-dmc-sysctrl", "syscon", "simple-mfd";
>
> we'd like to drop 'meson-' prefix, so better using "amlogic,gx-dmc-sysctrl",
> please take a look at the discussion here [1]
>
> [1] https://lkml.kernel.org/r/7hk1prmg4w.fsf@baylibre.com
>

On that subject, should I remove the meson keyword from dts only, or
from everything ?

e.g use amlogic_canvas_* symbols instead of meson_canvas_*, name the
source file "amlogic-canvas.c", etc. ?
