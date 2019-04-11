From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/5] media: platform: Aspeed: Remove use of reset line
Date: Thu, 11 Apr 2019 02:48:22 +0000
Message-ID: <CACPK8XdAdHhaRRTyniPeKDD0SruA3RxB3WCaeLaMzeMSSPsREw@mail.gmail.com>
References: <1554229478-5621-1-git-send-email-eajames@linux.ibm.com> <1554229478-5621-2-git-send-email-eajames@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554229478-5621-2-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-media@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, devicetree <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2 Apr 2019 at 18:24, Eddie James <eajames@linux.ibm.com> wrote:
>
> The reset line is toggled by enabling the clocks, so it's not necessary
> to manually toggle the reset as well.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
