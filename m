From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] dtc: Ensure #line directives don't consume data from the next line
Date: Fri, 31 May 2013 19:38:57 +0200
Message-ID: <87sj13dp72.fsf@hase.home>
References: <1370020450-18136-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1370020450-18136-1-git-send-email-swarren@wwwdotorg.org>
	(Stephen Warren's message of "Fri, 31 May 2013 11:14:10 -0600")
Sender: linux-kbuild-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, jdl@jdl.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mmarek@suse.cz, rob.herring@calxeda.com, grant.likely@secretlab.ca, linux-kbuild@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Stephen Warren <swarren@wwwdotorg.org> writes:

> Fix this by replacing {WS} with [ \t] so that it can't match line-breaks.

I think the other uses of {WS} shouldn't span lines either.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
