From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v4 2/2] ARM: l2x0: Add OF based initialization
Date: Wed, 6 Jul 2011 17:20:31 -0700
Message-ID: <CAOesGMhVuOVVeZQmt3fW3uXML0Op_f3x5e=-OeECJsWeybk9Ag@mail.gmail.com>
References: <1309984979-8847-1-git-send-email-robherring2@gmail.com>
	<1309984979-8847-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1309984979-8847-2-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux@arm.linux.org.uk, Barry Song <21cnbao@gmail.com>, workgroup.linux@csr.com, tglx@linutronix.de, weizeng.he@csr.com, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 6, 2011 at 1:42 PM, Rob Herring <robherring2@gmail.com> wrote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> This adds probing for ARM L2x0 cache controllers via device tree. Support
> includes the L210, L220, and PL310 controllers. The binding allows setting
> up cache RAM latencies and filter addresses (PL310 only).
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
