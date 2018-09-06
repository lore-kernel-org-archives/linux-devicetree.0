From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 16/21] x86: DT: use for_each_of_cpu_node iterator
Date: Thu, 6 Sep 2018 10:15:08 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1809061014430.1416@nanos.tec.linutronix.de>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-17-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-17-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 5 Sep 2018, Rob Herring wrote:

> Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
> has the side effect of defaulting to iterating using "cpu" node names in
> preference to the deprecated (for FDT) device_type == "cpu".
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: x86@kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
