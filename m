From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] device tree reverts and fix against v3.12-rc5
Date: Tue, 15 Oct 2013 17:20:51 -0700
Message-ID: <CA+55aFyJUzZu6WU70VYckOO3wnMbEOtL+5P9Qf=Ti7fBwuoBkg@mail.gmail.com>
References: <CACxGe6sw9xcPDDtbS5aJt9Q6H60x=HzDTvB80m1q7CHBW8VyUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACxGe6sw9xcPDDtbS5aJt9Q6H60x=HzDTvB80m1q7CHBW8VyUA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 15, 2013 at 2:43 PM, Grant Likely <grant.likely@secretlab.ca> wrote:
>
> *unless you find the signed tag questionable. You'll notice that I
> have a shiny-new gpg key which is currently only signed by my old key.
> Yes. Bad. I left it very late to create a new key, the old key is now
> expired, and I haven't gotten anyone else to sign the new one yet. It
> will be properly signed real-soon-now and I can resend the pull
> request when that happens if you don't like this one.

Hmm. Why did you do a 2048-bit key? Your old one was 4k..

Since you haven't gotten anybody to sign the new key yet, may I
suggest throwing this one away and doing a new 4096-bit key?

Yeah, yeah, I know, my *own* key is just 2048 bits, because back when
I created it we were discussing using various hardware tokens, and
some of them (at the time) didn't do more than 2k. So I shouldn't
really complain when somebody else does a 2k key. But that was a few
years ago, and I claim stupidity (I never did use a hardware token).

Anyway, pulled, since it was all signed by your previous key, and I
guess 2k is still supposed to be "good enough".

                Linus
