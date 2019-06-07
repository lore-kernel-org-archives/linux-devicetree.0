From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: Patches for v5.2-rc and v5.3 merge window
Date: Thu, 6 Jun 2019 22:24:33 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906062219490.28147@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1905201019010.15580@viisi.sifive.com>
 <7hr288exi7.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <7hr288exi7.fsf@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com
Cc: Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org, palmer@sifive.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

+ Rob, devicetree@, Mark

On Wed, 5 Jun 2019, Kevin Hilman wrote:

> Paul Walmsley <paul.walmsley@sifive.com> writes:
> 
> > Palmer has asked me to collect patches for the v5.2-rc releases and v5.3 
> > merge window, so I'll be doing so.  This is just a heads-up so no one is 
> > surprised to see 'patch queued' responses from me.
> 
> Speaking of v5.2-rc, any chance your DT series will make it for v5.2?

Ideally it would be nice to get acks from the DT folks first for:

https://lore.kernel.org/linux-riscv/20190602080500.31700-3-paul.walmsley@sifive.com/T/#u

https://lore.kernel.org/linux-riscv/20190602080500.31700-4-paul.walmsley@sifive.com/T/#u

If those come soon, I'd be fine with submitting them for v5.2-rc.  But if 
that stretches much further into the v5.2-rc series, it seems best to 
schedule it for v5.3.


> I'm hoping to have upstream v5.2 ready for testing in kernelCI, and
> that's one of the last missing pieces.  I just tested it on v5.2-rc3 and
> it's working great with mainline u-boot.

OK, great.  Thanks again for your testing help.


- Paul
