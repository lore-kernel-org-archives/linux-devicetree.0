From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: updating ePAPR
Date: Fri, 27 Sep 2013 10:37:56 -0500
Message-ID: <F02F49F7-1214-4DFF-A5E7-5DB33B3BCBD0@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoder Stuart-B08248 <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Stuart,

Is there any activity to update ePAPR?  If not what would be involved in doing so?

We are having some discussion about unit addresses and what ePAPR says in section 2.2.1.1 "Node Name Requirements" about them.  Technically the soc nodes in most (if not all) PPC dts would be in violation of what is stated here, in addition I don't think the simple-bus binding says anything about node names.

Here's a link to some of the discussion:

https://lkml.org/lkml/2013/9/19/301

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
