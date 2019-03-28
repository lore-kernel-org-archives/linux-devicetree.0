MIME-Version: 1.0
Date: Wed, 27 Mar 2019 19:41:22 -0500
References: <20190311145951.847-1-bunk@kernel.org>
	<20190311145951.847-2-bunk@kernel.org>
In-Reply-To: <20190311145951.847-2-bunk@kernel.org>
Message-ID: <CAL_JsqJiDaAj9itEh7Bbii+aDjTU=E3KyaCk6SToMtEMgPL_pQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pps-gpio.c: Add capture-clear
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Adrian Bunk <bunk@kernel.org>
Cc: Rodolfo Giometti <giometti@enneenne.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 11, 2019 at 10:06 AM Adrian Bunk <bunk@kernel.org> wrote:
>
> The code was already there but the device tree wiring was missing,
> resulting in out-of-tree patches enabling it in various places.
>
> This is safe to backport since it only has an effect if enabled
> in the device tree.

That describes every single patch adding DT support... It may be safe
to backport, but it's not stable material IMO.

You may want to send this to some other list besides the DT list if
you want it applied.

> Signed-off-by: Adrian Bunk <bunk@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  drivers/pps/clients/pps-gpio.c | 2 ++
>  1 file changed, 2 insertions(+)
