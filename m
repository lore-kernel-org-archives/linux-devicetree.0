From: Nick Hu <nickhu@andestech.com>
Subject: Re: [PATCH v3 4/4] nds32: Add document for NDS32 PMU.
Date: Thu, 25 Oct 2018 08:56:10 +0800
Message-ID: <20181025005610.GA8101@andestech.com>
References: <cover.1540350887.git.nickhu@andestech.com>
 <bdfe23ce3ded5299d7b525fcb16c353c2be31924.1540350887.git.nickhu@andestech.com>
 <20181024183247.GA12203@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181024183247.GA12203@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greentime Ying-Han =?utf-8?B?SHUo6IOh6Iux5ryiKQ==?= <greentime@andestech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "deanbo422@gmail.com" <deanbo422@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@redhat.com" <jolsa@redhat.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "pombredanne@nexb.com" <pombredanne@nexb.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, gregkh
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, Oct 25, 2018 at 02:32:48AM +0800, Rob Herring wrote:
> On Wed, Oct 24, 2018 at 11:32:40AM +0800, Nickhu wrote:
> > The document for how to add NDS32 PMU
> > in devicetree.
> > 
> > Signed-off-by: Nickhu <nickhu@andestech.com>
> > ---
> >  Documentation/devicetree/bindings/nds32/pmu.txt | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nds32/pmu.txt
> 
> Can you move to bindings/perf/ with other similar h/w. With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Sure, thanks!
Nick
