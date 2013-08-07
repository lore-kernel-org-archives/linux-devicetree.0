Return-Path: <devicetree-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:54771 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933398Ab3HGWNQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Wed, 7 Aug 2013 18:13:16 -0400
Message-ID: <5202C655.6050609@zytor.com>
Date: Wed, 07 Aug 2013 15:12:37 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 00/26] STA2X11 devicetree support for amba/pci
References: <52026AB5.80009@zytor.com>  <cover.1375867291.git.rubini@gnudd.com> <20130807211235.GA17863@mail.gnudd.com>
In-Reply-To: <20130807211235.GA17863@mail.gnudd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Alessandro Rubini <rubini@gnudd.com>
Cc: linux-kernel@vger.kernel.org, ciminaghi@gnudd.com, giancarlo.asnaghi@st.com, x86@kernel.org, mingo@redhat.com, linux@arm.linux.org.uk, tglx@linutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 08/07/2013 02:12 PM, Alessandro Rubini wrote:
> 
> Thank you for your feedback.  May I ask three more questions (this is
> the 1st)?
> 
> Is the patch-set a viable approach for mainline, modulo serious evaluation
> of the hairy IRQ details and the other bits?
> 

Serious evaluation is definitely called for.  I think that is all I can
say at this point.

When you say that on Northville this acts as "the main chipset".  The
typical definition of that is the firmware resides there.  Is that the
case in this platform as well (I am guessing no)?  It may sound like
splitting hairs but I'm trying to wrap my brain around this platform; it
sounds like I might have received a very wrong understanding.

	-hpa

