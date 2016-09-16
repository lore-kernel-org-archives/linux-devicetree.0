Return-Path: <mchehab@s-opensource.com>
Date: Fri, 16 Sep 2016 19:21:32 -0300
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: Re: [PATCH v3 20/21] doc: adjust references to development-process
Message-ID: <20160916192132.28e5f4d2@vento.lan>
In-Reply-To: <20160916112515.2e4653fb@lwn.net>
References: <cover.1473849886.git.mchehab@s-opensource.com>
	<c2427e2cd7b094ec9f4585ad2fac6c9408743373.1473849886.git.mchehab@s-opensource.com>
	<20160916112515.2e4653fb@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Markus Heiser <markus.heiser@darmarit.de>, Jani Nikula <jani.nikula@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Karsten Keil <isdn@linux-pingi.de>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Wim Van Sebroeck <wim@iguana.be>, Harry Wei <harryxiyou@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, "David S. Miller" <davem@davemloft.net>, Shuah Khan <shuah@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Doug Smythies <doug.smythies@gmail.com>, Peter Loeffler <peter.loeffler@guruz.at>, Philippe Loctaux <phil@philippeloctaux.com>, Chris Metcalf <cmetcalf@ezchip.com>, Alex Henrie <alexhenrie24@gmail.com>, Jakub Wilk <jwilk@jwilk.net>, Richard Weinberger <richard@nod.at>, SeongJae Park <sj38.park@gmail.com>, Minchan Kim <minchan@kernel.org>, Masanari Iida <standby24x7@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@codeaurora.org>, Diego Viola <diego.viola@gmail.com>, Vineet Gupta <vgupta@synopsys.com>, " =?UTF-8?B?w5h5dmluZA==?= A. Holm  <sunny@sunbase.org>, Jiri Kosina" <jikos@kernel.org>, Manuel =?UTF-8?B?UMOpZ291cmnDqS1Hb25uYXJk?= <mpg@elzevir.fr>, Alexander Kapshuk <alexander.kapshuk@gmail.com>, Darren Hart <dvhart@linux.intel.com>, Wei Jiangang <weijg.fnst@cn.fujitsu.com>, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, netdev@vger.kernel.org, kvm@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@zh-kernel.org, linux-pcmcia@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Em Fri, 16 Sep 2016 11:25:15 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Wed, 14 Sep 2016 08:06:49 -0300
> Mauro Carvalho Chehab <mchehab@s-opensource.com> wrote:
> 
> >  drivers/net/ppp/Kconfig                            |  2 +-
> >  drivers/pcmcia/Kconfig                             |  2 +-
> >  fs/Kconfig.binfmt                                  |  2 +-
> >  fs/fuse/Kconfig                                    |  2 +-
> >  net/Kconfig                                        |  4 ++--
> >  scripts/ver_linux                                  |  2 +-
> >  tools/testing/selftests/futex/README               |  2 +-  
> 
> This one probably needs to be split, when the time comes, so that those
> pieces can go to the proper maintainers; I'm not entirely comfortable
> taking them through the docs tree.

Yeah, this can be split (or eventually dropped, if we decide to use
symlinks or do some trick to avoid renaming the files).

Thanks,
Mauro
