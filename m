Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Sep 2019 07:56:15 +0100
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH input-next 1/4] dt-bindings: input: Convert mpr121
 binding to json-schema
Message-ID: <20190903065615.GA17646@bogus>
References: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
 <1567424417-3914-2-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1567424417-3914-2-git-send-email-michal.vokac@ysoft.com>
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 02, 2019 at 01:40:14PM +0200, Michal Vokáč wrote:
> Convert the mpr121 binding to DT schema format using json-schema.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> Hi Rob,
> 
> I will appreciate your help converting this binding. Currently
> the scheme is not valid and the error output of dt_binding_check
> is not really helpful.

What's the error? I don't see anything obvious.

> 
> Also, who shoud be the maintainer of this binding?
> I put Dmitry in there as he is the input subsystem maintainer but
> I am not sure it is correct.

My preference is the author or driver maintainer.

>  .../bindings/input/fsl,mpr121-touchkey.yaml        | 64 ++++++++++++++++++++++
>  .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 ----------
>  2 files changed, 64 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt
