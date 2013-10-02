From: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH] drivers: misc: add gpio wakeup driver
Date: Wed, 02 Oct 2013 13:02:13 +0200
Message-ID: <524BFD35.5040100@gmail.com>
References: <1380635719-31171-1-git-send-email-zonque@gmail.com> <CAOMZO5Aq5-bdY3yTD3DqjUVVrTPHZodb7_vfLQcvxfJRXNok4w@mail.gmail.com> <524AD693.6000304@gmail.com> <20131002105723.GA27287@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20131002105723.GA27287@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On 02.10.2013 12:57, Mark Brown wrote:
> On Tue, Oct 01, 2013 at 04:05:07PM +0200, Daniel Mack wrote:
>> On 01.10.2013 16:01, Fabio Estevam wrote:
> 
>>> Isn't it the same as the existing 'gpio-key,wakeup' ?
> 
>> Of course, I know the gpio-input driver can provide similar
>> functionality. My intention was just provide a way to wake up the system
>> without registering an input device for signals nobody is interested in
>> eventually.
> 
>> Don't know if that's reason enough to add a new driver though.
> 
> It does seem somewhat sensible - the signal might not have a sensible
> representation as an input device and the gpio-keys binding needs one.
> 

That was my intention as well, yes. Also, a system that does not have
any input devices could in theory disable CONFIG_INPUT alltogether. Not
sure how realisitic that scenario really is nowadays, but using the gpio
input driver for purpose of just waking up on LAN seems somewhat abusive.


Daniel

