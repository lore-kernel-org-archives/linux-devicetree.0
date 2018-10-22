From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
Date: Mon, 22 Oct 2018 17:42:13 -0500
Message-ID: <20181022224213.GA25145@bogus>
References: <20181015142010.13401-1-mick@ics.forth.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181015142010.13401-1-mick@ics.forth.gr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@sifive.com, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Oct 15, 2018 at 05:20:10PM +0300, Nick Kossifidis wrote:
> The /chosen node is optional so we should handle CMDLINE regardless
> the presence of /chosen/bootargs. Move handling of CMDLINE in
> early_init_dt_scan() instead.

I looked at this a while back. I'm not sure this behavior can be changed 
without breaking some MIPS platforms that could be relying on the 
current behavior. But trying to make sense of the MIPS code is a 
challenge and they have some other issues in this area.

Can't this be fixed by making /chosen manditory? I'd expect ultimately 
you are always going to need it.

I'd rather not resort to making this per arch. There's also some effort 
to consolidate cmd line handling[1].

Rob

[1] https://lkml.org/lkml/2018/9/27/1099
