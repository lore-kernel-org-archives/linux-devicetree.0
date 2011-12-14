From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/5] drivers: power: Rename bq20z75 to sbs-battery
Date: Wed, 14 Dec 2011 19:51:11 +0000
Message-ID: <20111214195111.GA26795@srcf.ucam.org>
References: <1323129487-24859-1-git-send-email-rklein@nvidia.com>
 <20111206174100.GA15449@srcf.ucam.org>
 <1323890766.8326.2.camel@rklein-linux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1323890766.8326.2.camel@rklein-linux2>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Anton Vorontsov <cbouatmailru@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

They're both i2c, so really all that ought to be different would be the 
glue to trigger the device probe. In theory. We'll see how well it works 
in practice...

-- 
Matthew Garrett | mjg59@srcf.ucam.org
