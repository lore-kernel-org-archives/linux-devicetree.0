From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] fixed-regulator: dt-bindings: Fixed building error for
 compatible property
Date: Thu, 19 Sep 2019 16:01:36 -0500
Message-ID: <CAL_JsqJktitBsBuQ5Zsfj5xvK+5T8jBXbjJkTtqo+NXnZe56fA@mail.gmail.com>
References: <1568875145-2864-1-git-send-email-pragnesh.patel@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568875145-2864-1-git-send-email-pragnesh.patel@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pragnesh Patel <pragnesh.patel@sifive.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2019 at 1:39 AM Pragnesh Patel
<pragnesh.patel@sifive.com> wrote:
>
> Compatible property is not of type 'string', so remove const:
> from it.
>
> Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---
>  Documentation/devicetree/bindings/regulator/fixed-regulator.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
