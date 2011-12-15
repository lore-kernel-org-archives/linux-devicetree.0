From: "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH] arm,davinci: configure davinci aemif chipselects
	through OF
Date: Thu, 15 Dec 2011 17:10:57 +0000
Message-ID: <DF0F476B391FA8409C78302C7BA518B604A17B@DBDE01.ent.ti.com>
References: <1322991679-20947-1-git-send-email-hs@denx.de>
	<4EE07E27.8090602@denx.de>
	<DF0F476B391FA8409C78302C7BA518B6040CBB@DBDE01.ent.ti.com>
	<201112081548.08548.arnd@arndb.de>
	<DF0F476B391FA8409C78302C7BA518B60471C1@DBDE01.ent.ti.com>
	<CAPcSpELkWJpP9-3UoNHF_aWSdd_b0FHNooNm+zF7UTjHEBC_vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <CAPcSpELkWJpP9-3UoNHF_aWSdd_b0FHNooNm+zF7UTjHEBC_vg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Ben Gardiner <bengardiner-ScDXFp4xN3PN+rMO2ozGnw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "gregkh-l3A5Bk7waGM@public.gmane.org" <gregkh-l3A5Bk7waGM@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ben,

On Wed, Dec 14, 2011 at 20:05:25, Ben Gardiner wrote:
> Hello Arnd and Sekhar,
> 
> On Tue, Dec 13, 2011 at 1:34 PM, Nori, Sekhar <nsekhar-l0cyMroinI0@public.gmane.org> wrote:
> > [...]
> > On Thu, Dec 08, 2011 at 21:18:08, Arnd Bergmann wrote:
> >> [...]
> >> If you want it to provide endpoint devices that are handled by
> >> distinct subsystems in Linux, I would make it an mfd multifunction
> >> device and make the common code a driver that scans the connected
> >> memories in order to register its child devices for each of the
> >> subsystems.
> >
> > Okay. Thanks for the explanation. Since the users of AEMIF at this
> > point are mtd devices, I propose moving it to drivers/mtd/davinci-aemif.c
> > (of course, mtd folks need to approve).
> 
> We have a vested interest in the davinci AEMIF setup facilities
> in-kernel; I'm electing to pipe-up now rather than later. Sadly our
> board is not yet in mainline so my opinions may be redirected to the
> bit-bucket as you see fit. We are planning to post a patch series for
> our complete board support -- but we can't do it right now.
> 
> The AEMIF is useful for interfacing to other asynchronous devices too;
> our newest board uses it for accessing memory mapped FPGA functional
> blocks via UIO and for permanent storage to a compact flash using
> pata_platform. In both cases the timings and mode for the chip-select
> are manually configured before the devices are registered. In both
> cases the performance of the endpoints could be better preserved
> across CPU freq transitions if the hooks for cpufreq transitions
> recently proposed by Sudhakar [1] were part of an mfd device and hence
> applicable to devices other than mtd.
> 
> Again, I apologize for requesting features for boards that are not yet
> in mainline.

No problem. Thanks for showing a use case I didn't know existed.
Now we just need to find someone to work on moving aemif to mfd
multifunction device :)

Thanks,
Sekhar
