Return-Path: <karsten@excalibur.cnev.de>
Date: Wed, 6 Jan 2016 20:08:40 +0100
From: Karsten Merker <merker@debian.org>
Subject: Re: [PATCH v11 0/8] Goodix touchscreen enhancements
Message-ID: <20160106190840.GA1839@excalibur.cnev.de>
References: <1447936001-21420-1-git-send-email-irina.tirdea@intel.com>
 <20151218011318.GB16016@dtor-ws>
 <20160105200343.GA3425@excalibur.cnev.de>
 <CAKdAkRQRJTONwakthxKDyG-=2CeaBjANiew6jpGc_1+ustSmGQ@mail.gmail.com>
 <20160106070055.GA5327@excalibur.cnev.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160106070055.GA5327@excalibur.cnev.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Irina Tirdea <irina.tirdea@intel.com>, Bastien Nocera <hadess@hadess.net>, Aleksei Mamlin <mamlinav@gmail.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Octavian Purdila <octavian.purdila@intel.com>, lkml <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 06, 2016 at 08:00:55AM +0100, Karsten Merker wrote:
> On Tue, Jan 05, 2016 at 02:07:47PM -0800, Dmitry Torokhov wrote:
> 
> > There is goodix branch at
> > git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git that we
> > should be able to merge in 4.5. It has your patches and half of
> > Irina's (with config dump and ESD support missing at the moment). If
> > you could give ti a quick spin I'd appreciate it.
 
> I have rebased your goodix branch onto linux-next 20160105 for
> testing, but unfortunately there seems to be some problem in
> linux-next - the kernel just silently hangs in early boot on the
> MSI Primo 81 (which is my only device with a goodix touchscreen). 
> I'll retry linux-next without your goodix branch on top of it
> later today to make sure that this is an unrelated problem.
> 
> With your goodix branch rebased onto 4.4-rc8, everything
> including the touchscreen works fine on the MSI Primo 81.

Hello,

as expected, plain linux-next 20160105 without the goodix patches
on top hangs in early boot as well, so this is not related to the
goodix patchset.

Regards,
Karsten
-- 
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten für Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.
