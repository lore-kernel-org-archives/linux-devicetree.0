From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Thu, 30 May 2013 11:38:01 -0600
Message-ID: <51A78E79.3060507@wwwdotorg.org>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
	<51A51A50.4050308@wwwdotorg.org>
	<CAPnjgZ04BKhQtpJct9tvN8rW5Wae+6fxxOOQDnEkmgrr-mAfwg@mail.gmail.com>
	<51A62F8D.9010208@wwwdotorg.org>
	<20130529213145.698353831A5@gemini.denx.de>
	<51A67EC1.2000208@wwwdotorg.org>
	<20130529223621.8B147383069@gemini.denx.de>
	<51A68A4C.4060505@wwwdotorg.org>
	<CAPnjgZ2_dR90CDtihSun3Yu7_i8TVpxn85XMFQRmzNJeRzDSmQ@mail.gmail.com>
	<51A6DF7C.30903@wwwdotorg.org>
	<20130530075644.2724138308E@gemini.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20130530075644.2724138308E@gemini.denx.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Wolfgang Denk <wd@denx.de>
Cc: u-boot-review <u-boot-review@google.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, Tom Rini <trini@ti.com>
List-Id: devicetree@vger.kernel.org

On 05/30/2013 01:56 AM, Wolfgang Denk wrote:
> Dear Stephen,
> 
> In message <51A6DF7C.30903@wwwdotorg.org> you wrote:
>>
>> It seems to be aimed specifically at enabling use of new dtc features
>> when present. That seems to be specifically against Wolfgang's goal of
>> not requiring new dtc features. There's no point allowing use of new dtc
> 
> Please stop planting statements on me that I did not make.

Sorry, but that's what I believe you meant. If you didn't mean that,
well then let's clear this up, and the rest of the conversation will be
a lot simpler:

I believe that for building the *.dts in U-Boot we should simply require
the user to have a version of dtc that supports the recently added
features such as:

* -i directive.
* Ability to parse the output of cpp well (e.g. #line directives, emit
useful error/warning messages in this case).
* Cell expression support.

Those are all present in the latest git repo for dtc.

If we do that, then we won't need any conditional logic in the U-Boot
makefiles. At least parts of Simon's patch won't be necessary.

I'm quite happy to achieve this requirement by having the user install
that dtc into the $PATH prior to running any U-Boot make, either
manually or via distro packages once they're available.

It is my understanding that you object to requiring such a new version
of dtc, irrespective of the means by which it's provided. If this is not
true, then please do let me know; it would vastly simplify matters.
