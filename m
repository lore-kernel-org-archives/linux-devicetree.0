From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add ipsps1 as a trivial device
Date: Mon, 12 Aug 2019 13:11:27 -0600
Message-ID: <CAL_JsqJ1742r8vkwMjzem5FYEis21kVJKamrBt-TgDpMHHFsPw@mail.gmail.com>
References: <20190812025242.15570-1-wangzqbj@inspur.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812025242.15570-1-wangzqbj@inspur.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Wang <wangzqbj@inspur.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jiri Kosina <trivial@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Patrick Venture <venture@google.com>, Anson Huang <anson.huang@nxp.com>, Jeremy Gebben <jgebben@sweptlaser.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Milton Miller <miltonm@us.ibm.com>, Lei YU <mine260309@gmail.com>, duanzhijia01@inspur.com, Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 11, 2019 at 8:52 PM John Wang <wangzqbj@inspur.com> wrote:
>
> The ipsps1 is an Inspur Power System power supply unit
>
> Signed-off-by: John Wang <wangzqbj@inspur.com>
> ---
> v3:
>     - Fix adding entry to the inappropriate line
> v2:
>     - No changes.
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
