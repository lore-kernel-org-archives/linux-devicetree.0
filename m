From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] tpm/tpm_ftpm_tee: trivial checkpatch fixes
Date: Tue, 13 Aug 2019 07:37:32 -0600
Message-ID: <CAL_JsqJaRmeV3Ne-HFTxMG_AZhaiGW_SKzgNrDMLJ5WGP0FXUQ@mail.gmail.com>
References: <20190813130559.16936-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813130559.16936-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, Mark Rutland <mark.rutland@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, linux-integrity@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 7:06 AM Sasha Levin <sashal@kernel.org> wrote:
>
> Fixes a few checkpatch warnings (and ignores some), mostly around
> spaces/tabs and documentation.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml |  2 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/char/tpm/tpm_ftpm_tee.c                        | 10 +++++-----
>  3 files changed, 8 insertions(+), 6 deletions(-)
