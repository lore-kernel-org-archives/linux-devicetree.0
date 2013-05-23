From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Thu, 23 May 2013 15:42:25 -0600
Message-ID: <519E8D41.9040508@wwwdotorg.org>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <1855701.nJQdRzsWsg@flatron> <20130518163001.GE1952@game.jcrosoft.org> <91263163.s2uhtsH4YZ@flatron> <20130519091736.GF1952@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20130519091736.GF1952@game.jcrosoft.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Doug Anderson <dianders@google.com>, Kukjin Kim <kgene.kim@gmail.com>
List-Id: devicetree@vger.kernel.org

On 05/19/2013 03:17 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
...
> how a pin can not have mux?

Well, if that's the way HW is designed, that's just the way it is.

There are certainly pins on Tegra which don't have a mux in HW, but have
some configuration options such as drive strength that can be configured.
