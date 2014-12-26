Return-Path: <xerofoify@gmail.com>
Return-Path: <xerofoify@gmail.com>
Message-ID: <549DCDC3.3040207@gmail.com>
Date: Fri, 26 Dec 2014 16:06:11 -0500
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
Subject: Re: Question about mv_print_info in sata_mv.c in sata_mv.c
References: <5498E9E4.4040308@gmail.com> <CAL_JsqKQYuZJBCPO7KTS3C=ef3_Z3KjMsJ4Foo=zJhS-XT+DMw@mail.gmail.com>
In-Reply-To: <CAL_JsqKQYuZJBCPO7KTS3C=ef3_Z3KjMsJ4Foo=zJhS-XT+DMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: Rob Herring <robherring2@gmail.com>
Cc: "tj@kernel.org >> Tejun Heo" <tj@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-ide@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Sorry Rob,
This is the code I am referring to:
 *      mv_print_info - Dump key info to kernel log for perusal.
 *      @host: ATA host to print info about
 *
 *      FIXME: complete this.
 *
 *      LOCKING:
 *      Inherited from caller.
 */
static void mv_print_info(struct ata_host *host)
{
	struct pci_dev *pdev = to_pci_dev(host->dev);
 	struct mv_host_priv *hpriv = host->private_data;
 	u8 scc;
 	const char *scc_s, *gen;

	/* Use this to determine the HW stepping of the chip so we know
	 * what errata to workaround
 	 */
	pci_read_config_byte(pdev, PCI_CLASS_DEVICE, &scc);
	if (scc == 0)
		scc_s = "SCSI";
	else if (scc == 0x01)
		scc_s = "RAID";
	else
		scc_s = "?";

	if (IS_GEN_I(hpriv))
		gen = "I";
	else if (IS_GEN_II(hpriv))
 		gen = "II";
	else if (IS_GEN_IIE(hpriv))
 		gen = "IIE";
	else
		gen = "?";
 
	dev_info(&pdev->dev, "Gen-%s %u slots %u ports %s mode IRQ via %s\n",
		 gen, (unsigned)MV_MAX_Q_DEPTH, host->n_ports,
		 scc_s, (MV_HP_FLAG_MSI & hpriv->hp_flags) ? "MSI" : "INTx");
}
I am assuming after reading this function's code, that this function is completed and no longer
needs a fix me comment above it to be completed.
Nick

On 2014-12-26 03:55 PM, Rob Herring wrote:
> On Mon, Dec 22, 2014 at 10:04 PM, nick <xerofoify@gmail.com> wrote:
>> Greetings Tejuin,Grant and Rob,
>> Hope you are having a good holidays. I am wondering if there is
>> anything we need to add to this function as stated in a fix me above it.I am pretty certain
>> there isn't but as the maintainers, I am double checking first with you:). Please let me
>> known if you think of something.
> 
> Grant and I are not actually maintainers of this driver.
> get_maintainer.pl is somewhat wrong here because it matches on regex
> that is present in about every driver that is DT enabled. I've sent a
> patch now to change that.
> 
> It would help also if you paste in the actually code you are referring to.
> 
> Rob
> 
>> Regards and Have a Great Holidays :),
>> Nick
