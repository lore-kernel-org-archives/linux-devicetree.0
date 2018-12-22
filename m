Return-Path: <SRS0=BUHn=O7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-it1-f195.google.com ([209.85.166.195]:51377 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387436AbeLVS0K (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Dec 2018 13:26:10 -0500
MIME-Version: 1.0
References: <20181128095421.20573-1-thierry.reding@gmail.com>
In-Reply-To: <20181128095421.20573-1-thierry.reding@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 21 Dec 2018 23:13:41 -0600
Message-ID: <CABb+yY2xO38kMSxTFE40v0rZ_tMp6di9QWU=fJdC00wWbofFGw@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] serial: Add Tegra Combined UART driver
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, Pekka Pessi <ppessi@nvidia.com>, Mika Liljeberg <mliljeberg@nvidia.com>, linux-tegra@vger.kernel.org, linux-serial@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 28, 2018 at 3:54 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Hi everyone,
>
> this is a reworked version of Mikko's earlier proposal[0]. I've reworked
> the TCU driver itself so that it relies less on global variables as well
> as added a Kconfig option to allow the console support to be selected. I
> also fixed a couple of issues that manifested themselves as I was moving
> towards the IRQ driven mode (TCU was passing a pointer to a local
> variable which was getting stored in the mailbox's ring buffer and the
> data pointed at was becoming stale by the time the mailbox got around to
> dequeue it).
>
> The biggest bulk of the changes is in the mailbox driver. This series
> addresses all of Jassi's comments from back at the time. One notable
> additional change is that shared mailboxes are now interrupt driven,
> which removes the need for polling mode.
>
> Unfortunately there is still an issue because the TCU uses the mailbox
> in atomic context for both TTY and console modes, so we get a sleeping-
> while-atomic BUG when using mbox_client->tx_block = true in order to
> rate-limit mbox_send_message(). In order to work around this, I added a
> new mbox_flush() API that will allow flushing the mailbox in atomic
> context by using the mailbox controller's implementation of ->flush().
> For Tegra HSP shared mailboxes this is done by spinning on the shared
> mailbox register until the receiver has marked the mailbox as empty. I
> have been running this locally for a couple of days now and it works
> perfectly.
>
> Furthermore this series incorporates Mikko's work in progress on
> splitting up the mailbox controllers and allowing multiple controllers
> to match on the same device tree node during mbox_request_channel().
>
> The new mbox_flush() API introduces a build-time dependency between the
> TCU driver and the mailbox framework, so patches 1-9 would need to go
> through one tree. Patch 9 was already acked by Greg, so I would suggest
> that Jassi pick up the first 9 patches and I pick up patches 10-12 into
> the Tegra tree.
>
Picked the first 8. The patch-9 is tcu serial driver and should go via tty.

-Jassi
