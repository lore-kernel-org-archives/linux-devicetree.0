From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/3] OF: Add a allnodes pointer back to the tree
Date: Thu, 12 Dec 2013 11:20:47 +0000
Message-ID: <20131212112047.87B5BC40637@trevor.secretlab.ca>
References: <1386684833-24112-1-git-send-email-panto@antoniou-consulting.com > <1386684833-24112-3-git-send-email-panto@antoniou-consulting.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386684833-24112-3-git-send-email-panto@antoniou-consulting.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On Tue, 10 Dec 2013 16:13:52 +0200, Pantelis Antoniou <panto@antoniou-consulting.com> wrote:
> As it stands right now there's no way for a node to point back
> to allnodes that the top level tree tracker for now.
> 
> This is problematic when using unflatten_dt_node more than once
> because is leads to the nodes to be linked incorrectly.
> 
> Keep track of the root allnodes on each device_node and modify
> unflaten_dt_node to match.

After our conversation on IRC and the decision to split unflattening the
tree from attaching it to be visible to the entire kernel, I'm going to
hold off on this patch. I suspect it will change in the process.

g.
