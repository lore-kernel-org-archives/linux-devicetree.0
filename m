From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH 4/5] OF: Export all DT proc update functions
Date: Tue, 12 Nov 2013 11:21:00 +0100
Message-ID: <8E692C7D-1598-407D-8DF5-FE9CC16DA8DF@antoniou-consulting.com>
References: <1383673816-29293-1-git-send-email-panto@antoniou-consulting.com> <1383673816-29293-5-git-send-email-panto@antoniou-consulting.com> <20131111160909.840EAC42311@trevor.secretlab.ca>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131111160909.840EAC42311@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Nov 11, 2013, at 5:09 PM, Grant Likely wrote:

> On Tue,  5 Nov 2013 19:50:15 +0200, Pantelis Antoniou <panto@antoniou-consulting.com> wrote:
>> There are other users for the proc DT functions.
>> Export them.
>> 
>> Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
> 
> These are all very much internal DT APIs. There is no way that anything
> outside of drivers/of should ever be calling them. (In fact, I want to
> be rid of the /proc/devicetree implementation entirely and put it into
> sysfs, but that is a separate patch set). If they need to be broken out
> into a header file, can they be put into something like
> drivers/of/of_private.h?
> 

That's fine by me.

I can move them to of_private.h, no problem there.

> g.
> 

Regards

-- Pantelis
