From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
Date: Mon, 22 Oct 2018 15:55:26 -0700 (PDT)
Message-ID: <mhng-08dbc241-46e4-411b-ba13-32435abde7ad@palmer-si-x1c4>
References: <20181022224213.GA25145@bogus>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181022224213.GA25145@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: robh@kernel.org, linux-mips@linux-mips.org
Cc: mick@ics.forth.gr, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, 22 Oct 2018 15:42:13 PDT (-0700), robh@kernel.org wrote:
> On Mon, Oct 15, 2018 at 05:20:10PM +0300, Nick Kossifidis wrote:
>> The /chosen node is optional so we should handle CMDLINE regardless
>> the presence of /chosen/bootargs. Move handling of CMDLINE in
>> early_init_dt_scan() instead.
>
> I looked at this a while back. I'm not sure this behavior can be changed
> without breaking some MIPS platforms that could be relying on the
> current behavior. But trying to make sense of the MIPS code is a
> challenge and they have some other issues in this area.
>
> Can't this be fixed by making /chosen manditory? I'd expect ultimately
> you are always going to need it.
>
> I'd rather not resort to making this per arch. There's also some effort
> to consolidate cmd line handling[1].

I'd rather make /chosen mandatory on RISC-V than to have per-arch handling, as 
like you've said there's already too much duplication.  That said, it does seem 
like a bug to me because the behavior seems somewhat arbitrary -- an empty 
/chosen node causing the built-in command-line argument handling to go off the 
rails just smells so buggy.

If that's the case, could we at least have something like 
"CONFIG_OF_CHOSEN_IS_MANDATORY" that provides a warning when there is no 
/chosen node and is set on architecture where the spec mandates /chosen?

I've added linux-mips to see if anyone has any ideas.
