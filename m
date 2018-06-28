From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 02/14] fsi: Move code around to avoid forward declaration
Date: Thu, 28 Jun 2018 13:40:39 +0930
Message-ID: <CACPK8Xey6O43avYBVsfvFujvanNaSsMdNBRLJa21DqXPnn5vuQ@mail.gmail.com>
References: <20180626232321.12372-1-benh@kernel.crashing.org> <20180626232321.12372-3-benh@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180626232321.12372-3-benh@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 27 June 2018 at 08:53, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> Move fsi_slave_set_smode() and its helpers to before it's
> first user and remove the corresponding forward declaration.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
