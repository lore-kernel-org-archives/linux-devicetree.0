From: Alexander Sverdlin <alexander.sverdlin@nsn.com>
Subject: Re: [PATCH 0/3 - V2] Introducing Device Tree Overlays
Date: Wed, 06 Nov 2013 09:53:46 +0100
Message-ID: <527A039A.8090409@nsn.com>
References: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ext Pantelis Antoniou <panto@antoniou-consulting.com>, Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On 05/11/13 19:41, ext Pantelis Antoniou wrote:
> The following patchset introduces Device Tree overlays, a method
> of dynamically altering the kernel's live Device Tree, along with
> a generic interface to use it in a board agnostic manner.

I'm glad to see it again! Will test the whole series on our MIPS64 platforms
(currently old patchset from bbxm tree is successfully used for a while).

-- 
Best regards,
Alexander Sverdlin.
