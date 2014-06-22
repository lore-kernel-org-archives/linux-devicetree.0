From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCHv7 2/5] mailbox: Introduce framework for mailbox
Date: Sun, 22 Jun 2014 12:56:39 +0200
Message-ID: <1403434599.532.4.camel@goatlord.localdomain>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
	 <1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-06-12 at 22:31 +0530, Jassi Brar wrote:
> Introduce common framework for client/protocol drivers and
> controller drivers of Inter-Processor-Communication (IPC).
>=20
> Client driver developers should have a look at
>  include/linux/mailbox_client.h to understand the part of
> the API exposed to client drivers.
> Similarly controller driver developers should have a look
> at include/linux/mailbox_controller.h
=2E..
> +struct mbox_chan *mbox_request_channel(const struct mbox_client *cl)
> +{
=2E..
> +	chan->cl =3D cl;

drivers/mailbox/mailbox.c: In function =E2=80=98mbox_request_channel=E2=
=80=99:
drivers/mailbox/mailbox.c:361:11: warning: assignment discards =E2=80=98=
const=E2=80=99
qualifier from pointer target type [enabled by default]
  chan->cl =3D cl;
