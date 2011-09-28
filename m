From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCHv2 08/10] ARM: u300: convert to MULTI_IRQ_HANDLER
Date: Wed, 28 Sep 2011 13:29:18 +0100
Message-ID: <20110928122918.GJ17204@pulham.picochip.com>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
	<1317206507-18867-9-git-send-email-jamie@jamieiles.com>
	<CACRpkdYOdWA2vg2zq+nhOPSvPN7zdy9NVsOcqfZ7i9W5Sq5cpw@mail.gmail.com>
	<20110928120340.GH17204@pulham.picochip.com>
	<CACRpkdarydeYAyOV8Cm134TtPeh9_qFSqWPkvpZjUE9yPNNtJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdarydeYAyOV8Cm134TtPeh9_qFSqWPkvpZjUE9yPNNtJA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, STEricsson_nomadik_linux@list.st.com, Jamie Iles <jamie@jamieiles.com>, rubini@unipv.it, linux-arm-kernel@lists.infradead.org, rmallon@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2011 at 02:18:14PM +0200, Linus Walleij wrote:
> On Wed, Sep 28, 2011 at 2:03 PM, Jamie Iles <jamie@jamieiles.com> wrote:
> 
> >> vic_single_handle_irq() needs to be modified to handle several
> >> ranges or atleast two.
> >
> > The platform IRQ handler is actually vic_handle_irq() that internally
> > calls vic_single_handle_irq() for each registered vic (in the order of
> > registration).
> 
> Ah I get it I'm dead wrong as usual :-)
> 
> I tried to apply them to test but Iget into dependency trouble with
> the referenced required patches, do you have some handy
> git branch with all stuff applied in order that I can pull in and
> test off?

Sure,

	git://github.com/jamieiles/linux-2.6-ji.git vic-dt

has all of the dependencies in there too.  Thanks for taking a look at 
the patches Linus!

Jamie
