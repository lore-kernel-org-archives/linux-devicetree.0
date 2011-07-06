From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] ARM: l2x0: Add OF based initialization
Date: Wed, 6 Jul 2011 22:52:16 +0200
Message-ID: <201107062252.16667.arnd@arndb.de>
References: <1309984979-8847-1-git-send-email-robherring2@gmail.com> <1309984979-8847-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1309984979-8847-2-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux@arm.linux.org.uk, Barry Song <21cnbao@gmail.com>, workgroup.linux@csr.com, Olof Johansson <olof@lixom.net>, tglx@linutronix.de, weizeng.he@csr.com, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Wednesday 06 July 2011 22:42:59 Rob Herring wrote:
> 
> From: Rob Herring <rob.herring@calxeda.com>
> 
> This adds probing for ARM L2x0 cache controllers via device tree. Support
> includes the L210, L220, and PL310 controllers. The binding allows setting
> up cache RAM latencies and filter addresses (PL310 only).
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
