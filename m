From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 31 Mar 2015 22:07:32 -0700
Message-ID: <1427864852.18175.53.camel@perches.com>
References: <1421859974-24507-1-git-send-email-pantelis.antoniou@konsulko.com>
	 <1421861843.10574.23.camel@perches.com>
	 <7EBFDD59-156A-42FB-AAF0-CE4A88219794@antoniou-consulting.com>
	 <20150330190432.42192C40A67@trevor.secretlab.ca>
	 <8421E7C5-C0D9-4C86-AA37-F6507B3BCC57@konsulko.com>
	 <20150401045231.70614C4082F@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150401045231.70614C4082F@trevor.secretlab.ca>
Sender: linux-doc-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robherring2@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-03-31 at 21:52 -0700, Grant Likely wrote:
> Thinking about this more, I'd like to suggest a different format that
> gives us a nice hack on the name that makes it easy to remember:
> 	'%pOF[...]'
> 'O' still means 'object', but it is also overloaded for Open Firmware.
> That still leaves %pO? for other object types.  What do you think?

I think that's fine.

