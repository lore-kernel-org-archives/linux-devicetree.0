From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v7 4/5] edac: Add APM X-Gene SoC EDAC driver
Date: Wed, 29 Apr 2015 20:23:39 +0200
Message-ID: <2496827.7XgVanEcLG@wuerfel>
References: <1430259045-19012-1-git-send-email-lho@apm.com>
 <4492781.xynGhSMMir@wuerfel>
 <CAL_Jsq+5f_dFJBnQ=vBj7dS8ebqGQe9_5c00CgmA7gT1yp=mZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+5f_dFJBnQ=vBj7dS8ebqGQe9_5c00CgmA7gT1yp=mZg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, "jcm@redhat.com" <jcm@redhat.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "patches@apm.com" <patches@apm.com>, Feng Kan <fkan@apm.com>, Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>, Loc Ho <lho@apm.com>, Doug Thompson <dougthompson@xmission.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 29 April 2015 11:57:09 Rob Herring wrote:
> >>
> >
> > I had not looked at the driver before, but I have one comment now:
> >
> > I think this can be simplified to registering a single platform_driver
> > that just matches all four compatible strings, with an appropriate data:
> >
> > +static struct of_device_id xgene_edac_of_match[] = {
> > +       { .compatible = "apm,xgene-edac-mcu", .data = &xgene_edac_mcu_data },
> > +       { .compatible = "apm,xgene-edac-pmd", .data = &xgene_edac_pmd_data },
> > +       { .compatible = "apm,xgene-edac-l3",  .data = &xgene_edac_l3_data },
> > +       { .compatible = "apm,xgene-edac-soc", .data = &xgene_edac_soc_data },
> > +       {},
> > +};
> 
> What exactly is shared here to combine all this into one driver? I
> would argue these are all independent functions and should be separate
> drivers. Add some library functions if there are common parts.

Right, that is probably even better. I was mostly worried about having
multiple platform_driver instances in a single module, which is a bit odd,
and your approach would solve that in a simpler way.

	Arnd
