From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: Add LM96000 as a trivial device
Date: Mon, 4 Feb 2019 14:27:15 -0600
Message-ID: <CAL_Jsq+Qej8XWDhLXzKJFSpuS7vdadko1N=EDyL-ysNuP4THcg@mail.gmail.com>
References: <20190204201906.8859-1-jgebben@sweptlaser.com> <20190204201906.8859-3-jgebben@sweptlaser.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204201906.8859-3-jgebben@sweptlaser.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeremy Gebben <jgebben@sweptlaser.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Linux HWMON List <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 4, 2019 at 2:19 PM Jeremy Gebben <jgebben@sweptlaser.com> wrote:
>
> The LM96000 is a temperature sensor and fan controller based
> on the LM85.
>
> Signed-off-by: Jeremy Gebben <jgebben@sweptlaser.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
