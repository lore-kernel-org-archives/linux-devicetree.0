From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Use interpolated brightness tables
 for veyron
Date: Wed, 2 Oct 2019 15:23:54 -0700
Message-ID: <CAD=FV=UnZtGN142yUu-NzVG00P=1MZ-X3aY+cjrMRCnL2D8xFg@mail.gmail.com>
References: <20191001160735.1.Ic9fd698810ea569c465350154da40b85d24f805b@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001160735.1.Ic9fd698810ea569c465350154da40b85d24f805b@changeid>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Oct 1, 2019 at 4:07 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> --- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> +++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> @@ -39,39 +39,8 @@
>
>  &backlight {
>         /* Minnie panel PWM must be >= 1%, so start non-zero brightness at 3 */
> -       brightness-levels = <
> -                         0   3   4   5   6   7
> -                         8   9  10  11  12  13  14  15
> -                        16  17  18  19  20  21  22  23
> -                        24  25  26  27  28  29  30  31
> -                        32  33  34  35  36  37  38  39
> -                        40  41  42  43  44  45  46  47
> -                        48  49  50  51  52  53  54  55
> -                        56  57  58  59  60  61  62  63
> -                        64  65  66  67  68  69  70  71
> -                        72  73  74  75  76  77  78  79
> -                        80  81  82  83  84  85  86  87
> -                        88  89  90  91  92  93  94  95
> -                        96  97  98  99 100 101 102 103
> -                       104 105 106 107 108 109 110 111
> -                       112 113 114 115 116 117 118 119
> -                       120 121 122 123 124 125 126 127
> -                       128 129 130 131 132 133 134 135
> -                       136 137 138 139 140 141 142 143
> -                       144 145 146 147 148 149 150 151
> -                       152 153 154 155 156 157 158 159
> -                       160 161 162 163 164 165 166 167
> -                       168 169 170 171 172 173 174 175
> -                       176 177 178 179 180 181 182 183
> -                       184 185 186 187 188 189 190 191
> -                       192 193 194 195 196 197 198 199
> -                       200 201 202 203 204 205 206 207
> -                       208 209 210 211 212 213 214 215
> -                       216 217 218 219 220 221 222 223
> -                       224 225 226 227 228 229 230 231
> -                       232 233 234 235 236 237 238 239
> -                       240 241 242 243 244 245 246 247
> -                       248 249 250 251 252 253 254 255>;
> +       brightness-levels = <3 255>;
> +       num-interpolated-steps = <251>;

I _think_ you want:

brightness-levels = <0 3 255>;
num-interpolated-steps = <252>;

Specifically:

* It seems like you're intending to keep everything the same and just
have a more compact representation, right?  Looking through the values
in '/sys/class/backlight/backlight' on minnie shows differences before
and after your patch.

* I think you want brightness of 0 to match to PWM level 0.

* If I put in printouts in the code with your table, I see:

pwm-backlight backlight: new number of brightness levels: 252
pwm-backlight backlight: i=0, j=0, lc=0, value=3
pwm-backlight backlight: i=0, j=1, lc=1, value=4
...
pwm-backlight backlight: i=0, j=250, lc=250, value=253
pwm-backlight backlight: lc=251, data->levels[i]=255

...as you can see, you end up missing assigning a value of 254.


-Doug
