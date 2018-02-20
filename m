MIME-Version: 1.0
In-Reply-To: <20180219133038.21995-2-ckeepax@opensource.cirrus.com>
References: <20180219133038.21995-1-ckeepax@opensource.cirrus.com>
	<20180219133038.21995-2-ckeepax@opensource.cirrus.com>
Date: Tue, 20 Feb 2018 07:41:22 -0600
Message-ID: <CAL_JsqLEhhe+sqtSTUWudNrSi9RnDEZ2nnQ6YViYELG+9KZspQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mfd: arizona: Update DT doc to support more
 standard reset binding
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 19, 2018 at 7:30 AM, Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> Changes since v1:
>  - Drop vendor prefix from new binding since it is a standard property.
>
> Thanks,
> Charles
>
>  Documentation/devicetree/bindings/mfd/arizona.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
