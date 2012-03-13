From: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH v2] stmmac: Add device-tree support
Date: Tue, 13 Mar 2012 12:40:45 +0100
Message-ID: <201203131240.46050.sr@denx.de>
References: <1331623394-14600-1-git-send-email-sr@denx.de> <201203131129.34449.sr@denx.de> <4F5F2B56.2060504@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4F5F2B56.2060504@st.com>
Sender: netdev-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@st.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree-discuss@ozlabs.org" <devicetree-discuss@ozlabs.org>, spear-devel <spear-devel@list.st.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 13 March 2012 12:11:18 Viresh Kumar wrote:
> On 3/13/2012 3:59 PM, Stefan Roese wrote:
> > Consistency. pr_err is used in this driver. So I'm sticking to it with
> > this patch as well.
> 
> Hmmm. I don't know, but can you add another patch before this one to move
> those prints.

Sure, I could. But I have to admit that this is currently not top of my 
priority.

Peppe as driver maintainer might have some input here. Is this dev_err vs 
pr_err a show-stopper for this patch?

Thanks,
Stefan
