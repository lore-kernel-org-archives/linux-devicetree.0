From: RICARD Christophe <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Aw: [PATCH v5 3/4] tpm/st33zp24/spi: Add st33zp24 spi phy
Date: Wed, 28 Jan 2015 20:13:33 +0100
Message-ID: <54C934DD.2040109@gmail.com>
References: <1422395850-21644-1-git-send-email-christophe-h.ricard@st.com>, <1422395850-21644-4-git-send-email-christophe-h.ricard@st.com> <trinity-1682f383-7165-419d-b9f7-ef1f205304d2-1422463682896@3capp-gmx-bs38>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <trinity-1682f383-7165-419d-b9f7-ef1f205304d2-1422463682896@3capp-gmx-bs38>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Huewe <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

A TPM command can be up to 2048 byte, A TPM response can be up to 1024 =
byte.
Between command and response, there are latency byte (up to 15 usually=20
on st33zp24 2 are enough).

Overall when sending a command and expecting an answer we need in worst=
=20
case:
2048 (for the TPM command) + 1024 (for the TPM answer).  We need some=20
latency byte before the answer is available (max 15).
We have 2048 + 1024 + 15.

I will go for a define making the code more readable together with a=20
comment.

Best Regards
Christophe
Le 28/01/2015 17:48, Peter Huewe a =C3=A9crit :
> Hi Christophe,
>
> sorry to be nitty picky but I still don't get this calculation
>
>
> + /* max tpm tx buffer(TPM_BUFSIZE) + max tpm rx buffer(TPM_BUFSIZE /=
 2)
> + * + MAX_SPI_LATENCY.
> + */
> + phy->spi_xfer.tx_buf =3D devm_kmalloc(&dev->dev, (TPM_BUFSIZE +
> + (TPM_BUFSIZE / 2) + MAX_SPI_LATENCY),
> + GFP_KERNEL);
> + if (!phy->spi_xfer.tx_buf)
> + return -ENOMEM;
> +
> + phy->spi_xfer.rx_buf =3D devm_kmalloc(&dev->dev, (TPM_BUFSIZE +
> + (TPM_BUFSIZE / 2) + MAX_SPI_LATENCY),
> + GFP_KERNEL);
> + if (!phy->spi_xfer.rx_buf)
> + return -ENOMEM;
>  =20
>
> and the comment
> + /* max tpm tx buffer(TPM_BUFSIZE) + max tpm rx buffer(TPM_BUFSIZE /=
 2)
> + * + MAX_SPI_LATENCY.
> does not help either.
>
>
>
> Why do you define TPM_BUFSIZE as 2048, add TPM_BUFSIZE/2 and somethin=
g called MAX_SPI_LATENCY to it to use it as your buffer size?
> Latency is for me something timing related.
>
> Since you use this TPM_BUFSIZE only in these two lines I'd be happy w=
ith either
> define which has this magical 2048+2014+15
> or (maybe better) add a reasonable comment describing the meaning of =
this strange calculation.
>
>
> Thanks,
> Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
