From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [RFC PATCH v2 03/10] ARM: at91: introduce OLD_IRQ_AT91 Kconfig
 option
Date: Sat, 29 Mar 2014 10:06:39 +0100
Message-ID: <20140329100639.5ea454bc@skate>
References: <1396029548-10928-1-git-send-email-b.brezillon.dev@gmail.com>
 <1396029548-10928-4-git-send-email-b.brezillon.dev@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1396029548-10928-4-git-send-email-b.brezillon.dev@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, Thomas Gleixner <tglx@linutronix.de>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dear Boris BREZILLON,

On Fri, 28 Mar 2014 18:59:01 +0100, Boris BREZILLON wrote:

> +config OLD_IRQ_AT91
> +	bool
> +	default false

I don't think "default false" is a valid Kconfig construct. It could be
"default n", but that's useless since "default n" is the default
behavior. So I believe you can simply get rid of that line.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
