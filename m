From: Viresh Kumar <viresh.kumar@st.com>
Subject: Re: [PATCH v2] stmmac: Add device-tree support
Date: Tue, 13 Mar 2012 16:41:18 +0530
Message-ID: <4F5F2B56.2060504@st.com>
References: <1331623394-14600-1-git-send-email-sr@denx.de> <4F5F0AF2.1070508@st.com> <201203131129.34449.sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <201203131129.34449.sr@denx.de>
Sender: netdev-owner@vger.kernel.org
To: Stefan Roese <sr@denx.de>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree-discuss@ozlabs.org" <devicetree-discuss@ozlabs.org>, spear-devel <spear-devel@list.st.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>
List-Id: devicetree@vger.kernel.org

On 3/13/2012 3:59 PM, Stefan Roese wrote:
> Consistency. pr_err is used in this driver. So I'm sticking to it with this 
> patch as well.

Hmmm. I don't know, but can you add another patch before this one to move those
prints.

-- 
viresh
