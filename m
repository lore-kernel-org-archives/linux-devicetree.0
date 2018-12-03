From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] OF: Add a warning in case chosen node is not present
Date: Mon, 3 Dec 2018 17:41:46 -0600
Message-ID: <20181203234146.GA26602@bogus>
References: <20181110005317.5631-1-mick@ics.forth.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181110005317.5631-1-mick@ics.forth.gr>
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

On Sat, Nov 10, 2018 at 02:53:17AM +0200, Nick Kossifidis wrote:
> On architectures that only get their bootargs through devicetree's
> chosen node (such as RISC-V), that node is mandatory. After a
> discussion with Rob [1] I'm adding a warning in case chosen node
> is not present, to let users know about it.
> 
> [1]: https://patchwork.ozlabs.org/patch/984224/#2016136
> 
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  drivers/of/fdt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied.
